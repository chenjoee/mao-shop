package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

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
@TableName("pms_attr_group")
public class AttrGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    private String attrGroupName;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 组描述
     */
    private String desc;

    /**
     * 分类id
     */
    private Long catelogId;


}
