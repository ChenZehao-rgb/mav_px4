// Auto-generated. Do not edit!

// (in-package mav_offboard.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MavOffbCtlType = require('../msg/MavOffbCtlType.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetMavOffbCtlTypeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ctlType = null;
    }
    else {
      if (initObj.hasOwnProperty('ctlType')) {
        this.ctlType = initObj.ctlType
      }
      else {
        this.ctlType = new MavOffbCtlType();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMavOffbCtlTypeRequest
    // Serialize message field [ctlType]
    bufferOffset = MavOffbCtlType.serialize(obj.ctlType, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMavOffbCtlTypeRequest
    let len;
    let data = new SetMavOffbCtlTypeRequest(null);
    // Deserialize message field [ctlType]
    data.ctlType = MavOffbCtlType.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mav_offboard/SetMavOffbCtlTypeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a64ef2cd96ddeb8b1cc79308e3fe0dd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    mav_offboard/MavOffbCtlType ctlType
    
    ================================================================================
    MSG: mav_offboard/MavOffbCtlType
    
    # mav offb control type for diff tasks
    uint8 mav_offb_ctl_type
    
    uint8 OFFBOARD_IGNORE = 0
    
    uint8 GOTO_SETPOINT_STEP = 1
    uint8 GOTO_SETPOINT_SMOOTH = 2
    
    uint8 GOTO_SETPOINTS_STEP = 3
    uint8 GOTO_SETPOINTS_SMOOTH = 4
    
    uint8 POS_CTRL_BY_ATT = 5
    
    uint8 POS_CTRL_BY_BODY_RATE = 6
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetMavOffbCtlTypeRequest(null);
    if (msg.ctlType !== undefined) {
      resolved.ctlType = MavOffbCtlType.Resolve(msg.ctlType)
    }
    else {
      resolved.ctlType = new MavOffbCtlType()
    }

    return resolved;
    }
};

class SetMavOffbCtlTypeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMavOffbCtlTypeResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMavOffbCtlTypeResponse
    let len;
    let data = new SetMavOffbCtlTypeResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mav_offboard/SetMavOffbCtlTypeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetMavOffbCtlTypeResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SetMavOffbCtlTypeRequest,
  Response: SetMavOffbCtlTypeResponse,
  md5sum() { return 'ba3bb96f001193382c990776aa0640ca'; },
  datatype() { return 'mav_offboard/SetMavOffbCtlType'; }
};
