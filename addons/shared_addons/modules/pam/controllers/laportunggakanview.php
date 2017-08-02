<script>
								$(document).ready(function(){
									$("table tr td#actionsl a").click(function(){
											var obj=$(this);
											$.ajax({
													type: "POST",
													data: '<?php echo $this->security->get_csrf_token_name();?>=<?php echo $this->security->get_csrf_hash(); ?>&',
													url: $(obj).attr('href'),
													beforeSend: function() {
														$(obj).after("<img id='waittugas9' style='margin:0;'  src='<?=base_url().'loading.png';?>' />");
													},
													success: function(msg) {
														$("#waittugas9").remove();
														location.reload();
													}
											});
											return false;
									});
								});
</script>
<div class="one_full">
	<section class="title">
		<h4>Data Penagihan</h4>
	</section>
	<? pr($datapenagihan);?>
	<section class="item">
		<div class="content">
				<table cellspacing="0">
					<thead>
						<tr>
							<th class="collapse"></th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td></td>
							</tr>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>

			<div class="buttons" >
				<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
					<span>Simpan</span>
				</button>
			</div>	
		</div>
	</section>
</div>