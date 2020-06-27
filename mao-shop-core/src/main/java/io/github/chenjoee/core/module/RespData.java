package io.github.chenjoee.core.module;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@ApiModel
@Data
public class RespData<T> {

    @ApiModelProperty(name = "code",value = "响应状态码")
    private Integer code;

    @ApiModelProperty(name = "msg",value = "提示消息")
    private String msg;

    @ApiModelProperty(name = "data",value = "响应数据")
    private T data;

    public RespData(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public RespData() {
    }

    public RespData(T data) {
        this.data = data;
    }

    public static<T> RespData<T> ok(T data){
        RespData<T> resp = new RespData<T>(data);
        resp.setCode(0);//操作成功
        resp.setMsg("success");
        return resp;
    }

    public static<T> RespData<T> fail(String msg){
        RespData<T> resp = new RespData<T>();
        resp.setCode(1);//操作失败
        resp.setMsg(msg);
        return resp;
    }

    public RespData<T> msg(String msg){
        this.setMsg(msg);
        return this;
    }

    public RespData<T> code(Integer code){
        this.setCode(code);
        return this;
    }


}
