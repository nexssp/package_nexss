// Nexss PROGRAMMER 2.0.0 - NodeJS
// Default template for JSON Data
// STDIN
const sleep = milliseconds => {
  return new Promise(resolve => setTimeout(resolve, milliseconds));
};

process.stdin.on("data", function(NexssStdin) {
  let NexssStdout;
  try {
    NexssStdout = JSON.parse(NexssStdin.toString());
  } catch (e) {
    console.error(e);
    process.exit(1);
  }

  testNotExistVariable = 555;

  testNotExistVariable2++;

  process.stdout.write(JSON.stringify(NexssStdout));
});

process.stdin.on("end", function() {
  //On Windows below is not needed.
  process.exit(0);
});
