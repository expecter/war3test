import DialogUtil from "@/DialogUtil";

export default class 选择难度{
    constructor(){
        if(isDebug){
            se.emit("选择难度",0)
        }else{
            DialogUtil.show(0,"选择难度",(index)=>{
                se.emit("选择难度",index);
            },"简单","中等","困难")
        }
    }
}