const blindFolkModel = require('../dbSchemes/schemebf');
const writerModel = require('../dbSchemes/schemaWriter');
const mongoose = require('mongoose');

module.exports.registerBlindFolk = async (req, res) => {

    try {
        const { mobile, name, age, examname, subjectname, examlanguage, examdate, examtime, examduration, examcity, examarea, commuteToWriter } = req.body;

        const getFolkData = await blindFolkModel.create({
            mobile,
            name,
            age,
            examname,
            subjectname,
            examlanguage,
            examdate,
            examtime,
            examduration,
            examcity,
            examarea,
            commuteToWriter
        });
        getFolkData.save();

        return res.status(201).json(getFolkData);
    }
    catch (err) {
        return res.status(500).send("Internal server error!!!");
    }

}

module.exports.registerWriter = async (req, res) => {

    try 
    {
        const { writername, writerage, writercity, writerarea, location, writerlanguageInExam, writerlanguage } = req.body;

        const writerData = await writerModel.create({
            writername,
            writerage,
            writercity,
            writerarea,
            location,
            writerlanguage,
            writerlanguageInExam
        });

        writerData.save();

        return res.status(201).json(writerData);
    }
    catch (err) 
    {
        return res.status(500).send('Internal server error' + err);
    }
}

module.exports.getBlindFolks = async (req,res) => {

    try
    {
        const {examcity,examarea} = req.body;

        let folkData = await blindFolkModel.find({examcity,examarea});
        folkData = folkData.filter((item) => item.requestStatus != true);
        return res.status(200).json(folkData);
    }
    catch(err)
    {
        return res.status(500).send('Internal server error:' + err);
    }

}

module.exports.selectTheFolk = async (req,res) => {
    try
    {
        const {folkId, writerId} = req.body;
        const folkid = await mongoose.Types.ObjectId(folkId);
        const writerid = await mongoose.Types.ObjectId(writerId);

        let folks = await blindFolkModel.updateOne({_id:folkid},{
            requestStatus:true,
            writerId
        });

        let writer = await writerModel.updateOne({_id:writerid},{
            isAvailable:false
        });

        return res.status(200).send(true);
    }
    catch(err)
    {
        return res.status(500).send('Internal server error:' + err);
    }
}

module.exports.showWriters = async (req,res) => {
    try
    {
        const folkId = await mongoose.Types.ObjectId(req.params.folkid);
        const folkData = await blindFolkModel.findOne({_id:folkId});
        if(folkData.requestStatus)
        {
            const writer = mongoose.Types.ObjectId(folkData.writerId);
            writerData = await writerModel.findOne({_id:writer});
            return res.status(200).json(writerData);
        }
        else
        {
            return res.status(200).send("Not accepted yet!!");
        }
    }
    catch(err)
    {
        return res.status(500).send('Internal server error:' + err);
    }
}
