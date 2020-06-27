package io.github.chenjoee.pms.service.impl;

import io.github.chenjoee.pms.entity.SkuInfo;
import io.github.chenjoee.pms.mapper.SkuInfoMapper;
import io.github.chenjoee.pms.service.ISkuInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * sku信息 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Service
public class SkuInfoServiceImpl extends ServiceImpl<SkuInfoMapper, SkuInfo> implements ISkuInfoService {

}
