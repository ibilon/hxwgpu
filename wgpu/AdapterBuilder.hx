package wgpu;

import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;

@:dox(hide)
@:noCompletion
class AdapterBuilder {
	public static macro function build():Array<Field> {
		var path = switch (Context.getType("wgpu.AdapterBuilder")) {
			case TInst(_.get() => t, _):
				FileSystem.absolutePath(Path.join([Path.directory(Context.getPosInfos(t.pos).file), "..", "build"]));

			default:
				throw "can't find the wgpu.AdapterBuilder type";
		}

		Context.getLocalClass().get().meta.add(":buildXml", [
			macro '
		<target id="haxe">
			<flag value="-L$path" />
			<lib name="-lwgpu_native" />
			<lib name="-lm" if="linux" />
			<lib name="-lpthread" if="linux" />
			<lib name="-ldl" if="linux" />
		</target>
		'
		], Context.currentPos());

		return Context.getBuildFields();
	}
}
