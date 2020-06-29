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
@TableName("pms_sku_image")
public class SkuImage implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long skuId;

    private String imgUrl;

    private Integer imgSort;

    /**
     * 是否默认显示
     */
    private Boolean defaultImg;


}
