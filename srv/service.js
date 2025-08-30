const cds = require('@sap/cds');
const { Attachments } = require('@cap-js/attachments');

module.exports = cds.service.impl(async function () {
  const attachmentService = await Attachments.init(this);
});
