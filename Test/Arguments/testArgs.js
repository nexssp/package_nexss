process.stdin.on("data", function (NexssStdin) {
  let NexssStdout;
  try {
    NexssStdout = JSON.parse(NexssStdin.toString());
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
  // Modify data
  //NexssStdout.NodeJSOutput = `Hello from NodeJS! ${process.version}`;
  NexssStdout.test = process.argv;

  // STDOUT
  process.stdout.write(JSON.stringify(NexssStdout));
});

process.stdin.on("end", function () {
  //On Windows below is not needed.
  process.exit(0);
});
