const nxsInfo = (...info) => {
  console.error(`NEXSS/info:`, ...info);
};

const nxsOk = (...ok) => {
  console.error(`NEXSS/ok:`, ...ok);
};

const nxsError = (...error) => {
  console.error(`NEXSS/error:`, ...error);
};

const nxsWarn = (...warn) => {
  console.error(`NEXSS/warn:`, ...warn);
};

const nxsTrace = (...trace) => {
  console.error(`NEXSS/trace:`, ...trace);
};

const nxsDebug = (...debug) => {
  console.error(`NEXSS/debug:`, ...debug);
};

module.exports = { nxsInfo, nxsOk, nxsError, nxsWarn, nxsTrace, nxsDebug };
