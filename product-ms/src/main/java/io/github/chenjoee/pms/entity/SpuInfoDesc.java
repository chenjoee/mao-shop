package io.github.chenjoee.pms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * spu信息介绍
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_spu_info_desc")
public class SpuInfoDesc implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long spuId;

    private String desc;


}
