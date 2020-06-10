package wgpu;

#if macro
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
#end

@:noCompletion
class NativeLibrary {
	#if macro
	macro static function build():Expr {
		// Don't build library if no compilation happen
		if (Context.defined("no-compilation")) {
			return macro null;
		}

		switch (Context.getType("wgpu.NativeLibrary")) {
			case TInst(_.get() => t, _):
				final cwd = Sys.getCwd();

				// Library root path.
				final path = FileSystem.absolutePath(Path.join([Path.directory(Context.getPosInfos(t.pos).file), ".."]));

				// wgpu-native current commit.
				Sys.setCwd(Path.join([path, "wgpu-native"]));

				var process = new Process("git", ["rev-parse", "HEAD"]);

				if (process.exitCode() != 0) {
					Sys.stderr().write(process.stderr.readAll());
					process.close();
					Context.fatalError("Couldn't get the version of wgpu-native", Context.currentPos());
				}

				final version = process.stdout.readLine();

				process.close();

				// Check current build.
				final hashPath = Path.join([path, "build", "hash.txt"]);

				if (FileSystem.exists(hashPath)) {
					final currentBuild = File.getContent(hashPath).split("\n")[0];

					if (currentBuild == version) {
						// Up-to-date, nothing to do.
						Sys.setCwd(cwd);
						return macro null;
					}
				}

				// Either doesn't exists or is not up-to-date, build.
				Sys.println("(Re)Building the wgpu-native library ... (this only happens when the version changes)");

				final process = new Process("make", ["lib-native"]);

				if (process.exitCode() != 0) {
					Sys.stderr().write(process.stderr.readAll());
					process.close();
					Context.fatalError("Couldn't build wgpu-native", Context.currentPos());
				}

				process.close();
				Sys.setCwd(cwd);

				// Copy the generated library to the build folder and update the hash.
				FileSystem.createDirectory(Path.join([path, "build"]));
				// TODO windows/mac might use a different library name
				File.copy(Path.join([path, "wgpu-native", "target", "debug", "libwgpu_native.a"]), Path.join([path, "build", "libwgpu_native.a"]));
				File.saveContent(Path.join([path, "build", "hash.txt"]), version);

			default:
				throw "can't find the wgpu.NativeLibrary type";
		}

		return macro null;
	}
	#end
}
