import * as std from "quickjs:std";
import * as os from "quickjs:os";

if (os.isatty(std.in.fileno())) {
  std.err.puts(
    "Pipe into this program to remove leading and trailing whitespace from it\n"
  );
  std.exit(1);
}

const input = std.in.readAsString();

std.out.puts(input.trim());
