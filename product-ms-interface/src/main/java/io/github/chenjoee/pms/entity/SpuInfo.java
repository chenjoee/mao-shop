package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * spu信息
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_spu_info")
public class SpuInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * spu名称
     */
    private String spuName;

    /**
     * 描述
     */
    private String spuDesc;

    /**
     * 分类id
     */
    private Long catelogId;

    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 上架状态（0 未上架， 1 已上架）
     */
    private Integer publishStatus;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


}
