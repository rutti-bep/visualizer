//
//  AudioDevice.c
//  AudioDevice
//
//  Created by 今野暁 on 2017/07/15.
//  Copyright © 2017年 rutti-bep. All rights reserved.
//

#include <sys/systm.h>
#include <mach/mach_types.h>

kern_return_t AudioDevice_start(kmod_info_t * ki, void *d);
kern_return_t AudioDevice_stop(kmod_info_t *ki, void *d);

kern_return_t AudioDevice_start(kmod_info_t * ki, void *d)
{
    printf("started AudioDevice.kext!!");
    return KERN_SUCCESS;
}

kern_return_t AudioDevice_stop(kmod_info_t *ki, void *d)
{
    printf("stoped AudioDevice.kext!!");
    return KERN_SUCCESS;
}
