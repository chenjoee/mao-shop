package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 商品分类
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_category")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 分类名称
     */
    private String name;

    private Long parnetId;

    /**
     * 等级	
     */
    private Integer catLevel;

    /**
     * 是否展示
     */
    private Boolean showStatus;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 单位
     */
    private String productUnit;

    /**
     * 数量	
     */
    private Integer productCount;

    /**
     * 图标
     */
    private String icon;


}
