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

  console.error("Error 1/2 from file 1: Standard STDERR");

  const x = 1;

  console.warn("Warning from file (Between erros No 1/2 and 2/2)");
  const y = 1;

  console.error("Error 2/2 from file 1: Standard STDERR");
  const z = 3;

  console.error("NEXSS/ok:This is nexss ok message");

  console.error("Error rrrorrr!!");

  console.error("NEXSS/warn:This is nexss warn message");

  console.error("Another one!!");

  console.error("NEXSS/error:This is nexss error message");

  process.stdout.write(JSON.stringify(NexssStdout));
});

process.stdin.on("end", function() {
  //On Windows below is not needed.
  process.exit(0);
});
