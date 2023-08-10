<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1><?php echo e($title); ?></h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo e(url('admin-panel/dashboard')); ?>"><i class="fa fa-dashboard"></i>Dashboard</a></li>
            <li><a href="<?php echo e(url('admin-panel/users')); ?>"><i class="fa fa-users"></i>Users</a></li>
            <li class="active"><?php echo e($title); ?></li>
        </ol>
    </section>

    <section class="content">
        <div class="row">
            <!-- /.col (left) -->
            <div class="col-md-12">
                <div class="box box-primary">
                    <form action="<?php echo e(url('admin-panel/users/store')); ?>" method="post">
                        <div class="box-body">
                            <?php echo $__env->make('admin.users.form', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
                <!-- /.box -->
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->
        </div>
    </section>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\shorten\views/admin/users/create.blade.php ENDPATH**/ ?>