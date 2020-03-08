// Nexss Programmer Pro 2.1

// stdin module
const { nxsError } = require("./NexssLog");
const { readFileSync } = require("fs");
module.exports = () => {
  if (process.platform !== "win32") {
    // Linux fix
    process.stdin.resume();
  }
  var chunks = [];
  try {
    do {
      var chunk = readFileSync(0, "utf8");
      chunks.push(chunk);
    } while (chunk.length);
  } catch (error) {
    // console.error(`STDIN Error: ${error}`);
    // console.trace();
    if (process.platform !== "win32") {
      process.stdin.destroy();
    }
  }

  let NexssStdout = JSON.parse(chunks.join(""));

  let Field_Value_1 = NexssStdout.nxsIn;
  if (!Field_Value_1) {
    if (NexssStdout._ && NexssStdout._[0]) {
      Field_Value_1 = NexssStdout._;
      delete NexssStdout._;
      // if(NexssStdout._.length>1)
    }
  }

  // resultField_1 = "nxsOut";
  // if (NexssStdout.nxsOutAs) {
  //   resultField_1 = NexssStdout.nxsOutAs;
  // }

  NexssStdout.resultField_1 = "nxsOut";
  if (NexssStdout.nxsOutAs) {
    NexssStdout.resultField_1 = NexssStdout.nxsOutAs;
  }
  NexssStdout.nxsIn = Field_Value_1;

  return NexssStdout;
};

// process.stdin.on("end", function() {
//   //On Windows below is not needed.
//   process.exit(0);
// });

// process.stdin.on("data", function(NexssStdin) {
//   let NexssStdout;
//   try {
//     NexssStdout = JSON.parse(NexssStdin.toString());
//   } catch (e) {
//     console.error(e);
//     process.exit(1);
//   }
//   let Field_Value_1 = NexssStdout.nxsIn;
//   if (!Field_Value_1) {
//     if (NexssStdout._ && NexssStdout._[0]) {
//       Field_Value_1 = NexssStdout._[0];
//     } else {
//       if (NexssStdout.FSGetPath) {
//         Field_Value_1 = NexssStdout.FSGetPath;
//       } else {
//         nxsError(
//           "You need to provide path. Or with parameter as Nexss FS/Get param OR nxsIn OR --FSGetPath"
//         );
//         process.exit(0);
//       }
//     }
//   }
