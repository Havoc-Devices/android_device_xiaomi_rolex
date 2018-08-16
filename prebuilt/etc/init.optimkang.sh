#!/system/bin/sh

################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}

function get-set-forall() {
    for f in $1 ; do
        cat $f
        write $f $2
    done
}



{

sleep 10

echo 90 > /proc/sys/kernel/sched_upmigrate
echo 70 > /proc/sys/kernel/sched_downmigrate
if [ -e "/proc/sys/kernel/sched_small_wakee_task_load" ]; then
	echo 10 > /proc/sys/kernel/sched_small_wakee_task_load
fi
echo 30 > /proc/sys/kernel/sched_init_task_load
if [ -e "/proc/sys/kernel/sched_heavy_task" ]; then
	echo 96 > /proc/sys/kernel/sched_heavy_task
fi
if [ -e "/proc/sys/kernel/sched_enable_power_aware" ]; then
	echo 1 > /proc/sys/kernel/sched_enable_power_aware
fi
if [ -e "/proc/sys/kernel/sched_enable_thread_grouping" ]; then
	echo 1 > /proc/sys/kernel/sched_enable_thread_grouping
fi
if [ -e "/proc/sys/kernel/sched_big_waker_task_load" ]; then
	echo 30 > /proc/sys/kernel/sched_big_waker_task_load
fi
if [ -e "/proc/sys/kernel/sched_small_task" ]; then
	echo 10 > /proc/sys/kernel/sched_small_task
fi
echo 2 > /proc/sys/kernel/sched_window_stats_policy
echo 5 > /proc/sys/kernel/sched_ravg_hist_size
echo 0 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 2 > /proc/sys/kernel/sched_spill_nr_run
echo 90 > /proc/sys/kernel/sched_spill_load
if [ -e "/proc/sys/kernel/sched_restrict_cluster_spill" ]; then
	echo 0 > /proc/sys/kernel/sched_restrict_cluster_spill
fi
echo 110 > /proc/sys/kernel/sched_wakeup_load_threshold
echo 950000 > /proc/sys/kernel/sched_rt_runtime_us
echo 1000000 > /proc/sys/kernel/sched_rt_period_us
if [ -e "/proc/sys/kernel/sched_migration_fixup" ]; then
	echo 1 > /proc/sys/kernel/sched_migration_fixup
fi
if [ -e "/proc/sys/kernel/sched_freq_dec_notify" ]; then
	echo 410000 > /proc/sys/kernel/sched_freq_dec_notify
fi
if [ -e "/proc/sys/kernel/sched_freq_inc_notify" ]; then
	echo 610000 > /proc/sys/kernel/sched_freq_inc_notify
fi
if [ -e "/proc/sys/kernel/sched_boost" ]; then
	echo 0 > /proc/sys/kernel/sched_boost
fi
echo 1 > /proc/sys/vm/oom_kill_allocating_task
echo 1024 > /sys/block/mmcblk0/bdi/read_ahead_kb
echo "cfq" > /sys/block/mmcblk0/queue/scheduler
echo 0 > /sys/block/mmcblk0/queue/add_random
echo 0 > /sys/block/mmcblk0/queue/iostats
echo 2 > /sys/block/mmcblk0/queue/nomerges
echo 0 > /sys/block/mmcblk0/queue/rotational
echo 1 > /sys/block/mmcblk0/queue/rq_affinity
echo 0 > /sys/block/zram0/queue/add_random
echo 0 > /sys/block/zram0/queue/iostats
echo 2 > /sys/block/zram0/queue/nomerges
echo 0 > /sys/block/zram0/queue/rotational
echo 1 > /sys/block/zram0/queue/rq_affinity
echo 8 > /sys/block/zram0/max_comp_streams
echo 0 > /proc/sys/vm/swappiness
echo 2 > /proc/sys/net/ipv4/tcp_ecn
echo 1 > /proc/sys/net/ipv4/tcp_dsack
echo 1 > /proc/sys/net/ipv4/tcp_low_latency
echo 1 > /proc/sys/net/ipv4/tcp_timestamps
echo 1 > /proc/sys/net/ipv4/tcp_sack
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling
fstrim /data
fstrim /cache
fstrim /system
fstrim /preload

}&
