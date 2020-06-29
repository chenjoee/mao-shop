package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 属性和属性分组关联表
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_attr_attrgroup_relation")
public class AttrAttrgroupRelation implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 属性id
     */
    private Long attrId;

    /**
     * 属性分组id
     */
    private Long attrgroupId;

    /**
     * 排序
     */
    private String attrSort;


}
