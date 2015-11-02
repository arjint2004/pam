<div class="one_half">
	<section class="title">
		<h4><?php echo lang('pam.settings_title'); ?></h4>
	</section>
	<section class="item">
	<div class="content">
		<?php echo form_open(uri_string(), 'class="crud"'); ?>
			<?php echo form_hidden('id', $settings->id); ?>
			<div class="form_inputs">
				<fieldset>
					<ul>
						<li class="<?php echo alternator('even', ''); ?>">
							<label for="folder_id"><?php echo lang('pam.folder_id_label');?></label>
							<?php echo form_dropdown('folder_id', $folders, $settings->folder_id); ?>
						</li>

						<li class="<?php echo alternator('even', ''); ?>">
							<label for="jquery"><?php echo lang('pam.jquery_label');?></label>
							<?php echo form_dropdown('jquery', array(1 => 'Yes', 0 => 'No'), $settings->jquery); ?>
						</li>
					</ul>
				</fieldset>
			</div>

			<div class="buttons align-right padding-top">
				<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'save_exit', 'cancel') )); ?>
			</div>

		<?php echo form_close(); ?>
	</div>
	</section>
</div>

<div class="one_half last scroll-follow">	
	<section class="title">
		<h4><?php echo lang('pam.settings_explanation_title'); ?></h4>
	</section>
	
	<section class="item">
	<div class="content">
		<div id="page-details">
		<p>
			<?php echo lang('pam.settings_explanation'); ?>
		</p>
		</div>
	</div>
	</section>
</div>