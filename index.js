const app=require('./app');

const db=require('./config/db');

const UserModel=require('./model/user.model');
const userRouter = require('./routes/user.router');

const port=process.env.port||3000;

app.get('/',(req,res)=>{
    res.send("hello world")
});

app.listen(port,()=>{
    console.log('Listen to port:${port}');
});