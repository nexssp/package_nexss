// Nexss PROGRAMMER 2.0.0 - NodeJS
// Default template for JSON Data
// STDIN
process.stdin.on("data", function (NexssStdin) {
  let NexssStdout;
  try {
    NexssStdout = JSON.parse(NexssStdin.toString());
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
  // Modify data
  NexssStdout.Hello1 = `Hello 1 Test MultipleProjects`;
  NexssStdout.test = "test1";
  // STDOUT
  process.stdout.write(JSON.stringify(NexssStdout));
});

process.stdin.on("end", function () {
  //On Windows below is not needed.
  process.exit(0);
});
