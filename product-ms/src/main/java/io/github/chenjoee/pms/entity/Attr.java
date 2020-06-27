package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_attr")
public class Attr implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 属性名
     */
    private String pmsAttrcol;

    /**
     * 是否需要检索
     */
    private Boolean searchType;

    /**
     * 值类型，0单个值，1可以选择多个值
     */
    private Boolean valueType;

    /**
     * 图标
     */
    private String icon;

    /**
     * 可选值列表
     */
    private String valueSelect;

    /**
     * 属性类型 0 基本属性(spu)，1 销售属性（sku）
     */
    private Boolean attrType;

    /**
     * 启用状态
     */
    private Boolean enable;

    /**
     * 所属分类（冗余）
     */
    private Long catelogId;

    /**
     * 是否快速展示，是否展示在介绍上， 在sku中仍然可以调整
     */
    private Boolean showDesc;


}
