package com.jin.DTO;

public class Leveldb {

    // 레벨 
    private Integer lvl;

    // 레벨별 총 경험치 필요량 
    private Integer lvmaxexp;

    public Integer getLvl() {
        return lvl;
    }

    public void setLvl(Integer lvl) {
        this.lvl = lvl;
    }

    public Integer getLvmaxexp() {
        return lvmaxexp;
    }

    public void setLvmaxexp(Integer lvmaxexp) {
        this.lvmaxexp = lvmaxexp;
    }
}