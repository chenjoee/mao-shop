package io.github.chenjoee.pms.service.impl;

import io.github.chenjoee.pms.entity.SpuAttrValue;
import io.github.chenjoee.pms.mapper.SpuAttrValueMapper;
import io.github.chenjoee.pms.service.ISpuAttrValueService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * spu属性值, 注意和sku属性区分； 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Service
public class SpuAttrValueServiceImpl extends ServiceImpl<SpuAttrValueMapper, SpuAttrValue> implements ISpuAttrValueService {

}
