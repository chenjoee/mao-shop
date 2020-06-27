package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * spu属性值, 注意和sku属性区分；
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_spu_attr_value")
public class SpuAttrValue implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long spuId;

    private Long attrId;

    /**
     * 属性名， 冗余字段
     */
    private String attrName;

    /**
     * 属性值
     */
    private String attrValue;

    /**
     * 展示排序	
     */
    private Integer attrSort;

    /**
     * 是否快速展示
     */
    private String quickShow;


}
