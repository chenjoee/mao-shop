package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * sku信息
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_sku_info")
public class SkuInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long spuId;

    /**
     * 名称	
     */
    private String skuName;

    /**
     * 描述
     */
    private String skuDesc;

    /**
     * 分类id
     */
    private Long catelogId;

    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 是否默认展示图片
     */
    private Boolean skuDefaultImg;

    /**
     * 标题
     */
    private String skuTitle;

    /**
     * 子标题
     */
    private String skuSubtitle;

    /**
     * 价格
     */
    private Integer price;

    /**
     * 重量
     */
    private Integer weight;


}
