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
									$("table tr td a#penagihan").click(function(){
											var obj=$(this);
											$.ajax({
													type: "POST",
													data: '<?php echo $this->security->get_csrf_token_name();?>=<?php echo $this->security->get_csrf_hash(); ?>&',
													url: $(obj).attr('href'),
													beforeSend: function() {
														// $(obj).after("<img id='waittugas22' style='margin:0;'  src='<?=base_url().'loading.png';?>' />");
														$(obj).after("<span id='wtt23'>..</span>");
													},
													success: function(msg) {
														$("#wtt23").remove();
														if(msg==1){
															$(obj).parent('td').css('background-color','green');
															$(obj).css('color','white');
														}else{
															$(obj).parent('td').css('background-color','red');
															$(obj).css('color','white');
														}
														
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
	<? //pr($pembayaranMenunggak);
		function cb($a, $b) {
			return strtotime($a['bulan']) - strtotime($b['bulan']);
		}
	?>
	<section class="item">
		<div class="content">
				<table cellspacing="0">
					<thead>
						<tr>
							<th width="20"><?php //echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
							<th>No</th>
							<th>Alamat</th>
							<th class="collapse">Nama</th>
							<? 
							sort($pembayaranMenunggak[1]['bulan']);
							// pr($pembayaranMenunggak[1]['bulan']);
							foreach($pembayaranMenunggak[1]['bulan'] as $buln=>$bulannya){?>
							<th class="collapse"> 
							<?
							$ddt=explode('-',$bulannya['bulan']);
							echo date("M", mktime(0, 0, 0, $ddt[1]  ,$ddt[2] , $ddt[0]));?></th>
							<? } ?>
							<th class="collapse">Total</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						// $jmlbln=count($pembayaranMenunggak[1]['bulan']);

						$i=1;
						foreach ($pembayaranMenunggak as $id_pelanggan=>$dataNunggak) { 
						// if($id_pelanggan==323){
						
							 
							 usort($dataNunggak['bulan'], 'cb');
							
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
								<td><?php 	
								// pr($dataNunggak['bulan']);
								// pr(count($pembayaranMenunggak[1]['bulan'])).'<br />';
								// pr(count($dataNunggak['bulan']));
								// echo count($pembayaranMenunggak[1]['bulan'])-count($dataNunggak['bulan']);
								
								$subtitudearray=array();							
								if(count($dataNunggak['bulan'])<count($pembayaranMenunggak[1]['bulan'])){
									$slselisih=count($pembayaranMenunggak[1]['bulan'])-count($dataNunggak['bulan']);
									// empty($subtitudearray);
									for($iz=0;$iz<$slselisih;$iz++){
									// echo $iz.'<br />';
										$subtitudearray[$iz]=array(
															'nama' => '',
															'alamat' => '',
															'nomor' => 0,
															'id' => 0,
															'id_pelanggan' => 0,
															'bulan' => '0000:00:00',
															'baca_meter' => 0,
															'harus_bayar' => 0,
															'dibayar' => 0,
															'selisih' => 0,
															'tanggal' => '0000-00-00 00:00:00',
															'status' => 0,
															'penagihan' => 0,
															'bulan_penagihan' => '0000-00-00'
										);
									}
									 // pr(count($pembayaranMenunggak[1]['bulan']));
									 // pr(count($dataNunggak['bulan']));
									 // pr($slselisih);
									 // pr(count($subtitudearray));
									$dataNunggak['bulan']=array_merge($subtitudearray,$dataNunggak['bulan']);
								} 
								?></td>
								<td style="color:<?=$color?>;"><?=$i++;?></td>
								<td style="color:<?=$color?>;">Gamp <?=$dataNunggak['alamat']?>(<?php //echo $bulannya['nomor']+1;?>)</td>
								<td style="color:<?=$color?>;"><?=$dataNunggak['nama']?></td>
								<? 
								
								// pr($dataNunggak['bulan']);
								foreach($dataNunggak['bulan'] as $buln=>$bulannya){
								   if($bulannya['status']==1){
										$mark="background-color:darkseagreen;"; 
										$lunas="[Lunas]";
								   }elseif($bulannya['status']==0){
									    $mark="background-color:none;";
										$lunas="";
										$tottunggakan[$id_pelanggan]=$tottunggakan[$id_pelanggan]+$bulannya['harus_bayar'];
								   }
								?>
								<td style="<?=$mark?> color:<?=$color?>;"><?
								if($lunas!=""){
									echo $bulannya['harus_bayar'];
									echo $lunas;
								}else{
									// $id_pelanggan=0,$bulan=0,$tahun=0,$nomark=0
									$dt=explode('-',$bulannya['bulan']);
									
									echo "<a id='penagihan' href='".base_url('admin/pam/printkwitansi/'.$id_pelanggan.'/'.$dt[1].'/'.$dt[0].'/1')."' >".$bulannya['harus_bayar']."</a>";
								}

								?></td>
								<? } ?>
								<td  style="color:<?=$color?>;"><b><?=$tottunggakan[$id_pelanggan]?></b></td>
							</tr>
						<? 
						$tosemua=$tosemua+$tottunggakan[$id_pelanggan];
						} //} ?>
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