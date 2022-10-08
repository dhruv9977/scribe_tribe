const mongoose = require('mongoose');

const writerScheme = mongoose.Schema(
    {
        writername:{
            type:String,
            required:true
        },
        writerage:{
            type:Number,
            required:true
        },
        writercity:{
            type:String,
            required:true
        },
        writerarea:{
            type:String,
            required:true
        },
        location:{
            type:Array
        },
        writerlanguageInExam:{
            type:Array
        },
        writerlanguage:{
            type:Array
        },
        isAvailable:{
            type:Boolean,
            default:true
        }
    },
    {
        timestamps:true
    }
)

module.exports = mongoose.model('writer',writerScheme);