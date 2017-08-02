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


	<section class="item">
		<div class="content">
				<style>
				input[type="text"], input[type="password"], textarea {
					margin: 0;
				}
				</style>
				<input type="hidden" name="bulaninput" value="<?=$bulan_a?>" /> 
				<? if(isset($_POST['bulan']) && isset($_POST['tahun'])){?>
					<input type="hidden" name="bulan" value="<?=$_POST['bulan']?>" /> 
					<input type="hidden" name="tahun" value="<?=$_POST['tahun']?>" /> 
				<? }else{ ?>
					<!--<input type="hidden" name="bulan" value="<?=$bln?>" /> 
					<input type="hidden" name="tahun" value="<?=$thn?>" />-->
				<? } 
				foreach ($pelanggan as $kk=>$datapelangganx) { 
					switch($datapelangganx['alamat']){
								case 1:
									$otp[1][]=$datapelangganx;
								break;
								case 2:
									$otp[2][]=$datapelangganx;
								break;
								case 3:
									$otp[3][]=$datapelangganx;
								break;
								case 4:
									$otp[4][]=$datapelangganx;
								break;
								case 5:
									$otp[5][]=$datapelangganx;
								break;
							}
				}
				// pr($otp);
				?>
	
				<?php foreach ($otp as $gp=>$datapelangganc) { ?>
					<section class="title">
						<h4>Data Pembayaran iuran Pelanggan Gamplong <?php echo $gp ; ?> bulan <?=$bulan?> Tahun <?=$_POST['tahun']?></h4>
					</section>
				<table cellspacing="0" id="allset" border="1">
					<thead>
						<tr>
							
							<th>No</th>
							<th>Alamat</th>
							<th width="250" class="collapse">Nama</th>
							<th width="100" class="collapse"><?=$bulan?></th>
							<th width="100" class="collapse"><?=$bulan_sebelum?></th>
							<th>Pakai</th>
							<th width="100">Bayar</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=1;foreach ($datapelangganc as $datapelanggan) { 
							switch($datapelanggan['alamat']){
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
								
								<td ><?php echo $i++;?></td>
								<td >Gamplong <?php echo $datapelanggan['alamat'];?> (<?php echo $datapelanggan['nomor'];?>)</td>
								<td class="collapse" ><? echo $datapelanggan['nama'];?></td>
								
								<td class="collapse" align="center"><?=@$baca_meter_current[$datapelanggan['id']]['baca_meter']?></td>
								
								<td class="collapse" align="center"><?=@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter']?></td>
								
								<td class="collapse" align="center"><?=@$baca_meter_current[$datapelanggan['id']]['baca_meter']-@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter']?></td>
								<td class="collapse" align="right"><?=bayar(@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter'],@@$baca_meter_current[$datapelanggan['id']]['baca_meter'],$datapelanggan['jenis'])?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
				<div class="page-break"></div>
				<?php } ?>
		</div>
	</section>
</div>