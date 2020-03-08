const {
  nxsInfo,
  nxsOk,
  nxsWarn,
  nxsError
} = require(`${process.env.NEXSS_PACKAGES_PATH}/Nexss/Lib/NexssLog.js`);

const NexssIn = require(`${process.env.NEXSS_PACKAGES_PATH}/Nexss/Lib/NexssIn.js`);

// console.log(JSON.stringify());

let NexssStdout = NexssIn();

nxsInfo("Nexss info message");
nxsOk("Nexss ok message");
nxsWarn("Nexss warn message");
nxsError("Nexss error message");

delete NexssStdout.resultField_1;
delete NexssStdout.nxsIn;
process.stdout.write(JSON.stringify(NexssStdout));
