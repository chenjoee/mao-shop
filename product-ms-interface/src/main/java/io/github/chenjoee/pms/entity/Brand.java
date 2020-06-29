package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 品牌
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_brand")
public class Brand implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 名称
     */
    private String name;

    /**
     * log
     */
    private String logo;

    /**
     * 描述
     */
    private String desc;

    /**
     * 是否展示
     */
    private Integer showStatus;

    /**
     * 首字母
     */
    private String firstLetter;

    private String sort;


}
