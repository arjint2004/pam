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
		<h4>Tunggakan Pelanggan</h4>
	</section>
	<? //pr($pembayaranMenunggak);?>
	<section class="item">
		<div class="content">
				<table cellspacing="0">
					<thead>
						<tr>
							<th width="20"><?php //echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
							<th>No</th>
							<th>Alamat</th>
							<th class="collapse">Nama</th>
							<? foreach($pembayaranMenunggak[1]['bulan'] as $buln=>$bulannya){?>
							<th class="collapse"> 
							<?
							$ddt=explode('-',$buln);
							echo date("M", mktime(0, 0, 0, $ddt[1]  ,$ddt[2] , $ddt[0]));?></th>
							<? } ?>
							<th class="collapse">Total</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$i=1;
						foreach ($pembayaranMenunggak as $id_pelanggan=>$dataNunggak) { 
							switch($dataNunggak['alamat']){
								case 1:
									$color="black";
								break;
								case 2:
									$color="green";
								break;
								case 3:
									$color="blue";
								break;
								case 4:
									$color="fuchsia";
								break;
								case 5:
									$color="red";
								break;
							}
						?> 
							<tr>
								<td><?php //echo form_checkbox('action_to[]', $datapelanggan['id']) ?></td>
								<td style="color:<?=$color?>;"><?=$i++;?></td>
								<td style="color:<?=$color?>;">Gamp <?=$dataNunggak['alamat']?></td>
								<td style="color:<?=$color?>;"><?=$dataNunggak['nama']?></td>
								<? foreach($dataNunggak['bulan'] as $buln=>$bulannya){
								   if($bulannya['status']==1){
										$mark="background-color:darkseagreen;"; 
										$lunas="[Lunas]";
								   }elseif($bulannya['status']==0){
									    $mark="background-color:none;";
										$lunas="";
										$tottunggakan[$id_pelanggan]=$tottunggakan[$id_pelanggan]+$bulannya['harus_bayar'];
								   }
								?>
								<td style="<?=$mark?> color:<?=$color?>;"> <?=$bulannya['harus_bayar']?> <?=$lunas?> </td>
								<? } ?>
								<td  style="color:<?=$color?>;"><b><?=$tottunggakan[$id_pelanggan]?></b></td>
							</tr>
						<? 
						$tosemua=$tosemua+$tottunggakan[$id_pelanggan];
						} ?>
						<tr>
							<td colspan="6">TOTAL</td>
							<td><b><?=$tosemua?></b></td>
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