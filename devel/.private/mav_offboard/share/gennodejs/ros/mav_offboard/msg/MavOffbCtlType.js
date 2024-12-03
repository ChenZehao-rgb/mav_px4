// Auto-generated. Do not edit!

// (in-package mav_offboard.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MavOffbCtlType {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mav_offb_ctl_type = null;
    }
    else {
      if (initObj.hasOwnProperty('mav_offb_ctl_type')) {
        this.mav_offb_ctl_type = initObj.mav_offb_ctl_type
      }
      else {
        this.mav_offb_ctl_type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MavOffbCtlType
    // Serialize message field [mav_offb_ctl_type]
    bufferOffset = _serializer.uint8(obj.mav_offb_ctl_type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MavOffbCtlType
    let len;
    let data = new MavOffbCtlType(null);
    // Deserialize message field [mav_offb_ctl_type]
    data.mav_offb_ctl_type = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mav_offboard/MavOffbCtlType';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ecfa29034218f9eaa269cda4f3eba64a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
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
    const resolved = new MavOffbCtlType(null);
    if (msg.mav_offb_ctl_type !== undefined) {
      resolved.mav_offb_ctl_type = msg.mav_offb_ctl_type;
    }
    else {
      resolved.mav_offb_ctl_type = 0
    }

    return resolved;
    }
};

// Constants for message
MavOffbCtlType.Constants = {
  OFFBOARD_IGNORE: 0,
  GOTO_SETPOINT_STEP: 1,
  GOTO_SETPOINT_SMOOTH: 2,
  GOTO_SETPOINTS_STEP: 3,
  GOTO_SETPOINTS_SMOOTH: 4,
  POS_CTRL_BY_ATT: 5,
  POS_CTRL_BY_BODY_RATE: 6,
}

module.exports = MavOffbCtlType;
