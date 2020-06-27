package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * sku属性值
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_sku_attr_value")
public class SkuAttrValue implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long skuId;

    private Long attrId;

    /**
     * 冗余字段
     */
    private String attrName;

    private String attrValue;

    private Integer attrSort;


}
