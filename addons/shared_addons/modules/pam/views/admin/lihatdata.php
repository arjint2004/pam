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
									$("#btn_print").click(function(){
											var obj=$(this);
											$('form#simpanjaringan').attr('target','_blank')
											$('form#simpanjaringan').attr('action','<?=base_url('admin/pam/print_data')?>')
											$('form#simpanjaringan').submit()
											return false;
									});
									$("#btn_printck").click(function(){
											var obj=$(this);
											$('form#simpanjaringan').attr('target','_blank')
											$('form#simpanjaringan').attr('action','<?=base_url('admin/pam/print_datack')?>')
											$('form#simpanjaringan').submit()
											return false;
									});
								});
</script>
<div class="one_full">
	<section class="title">
		<h4>Lihat Data Pelanggan</h4>
	</section>

	<section class="item">
		<div class="content">
		<fieldset id="filters">
			<legend>Filters & Search</legend>
			<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpanjaringan"'); 
					if(!isset($_POST['bulan'])){
						$_POST['bulan']=date('m')-1;
					}
					if(!isset($_POST['tahun'])){
						$_POST['tahun']=date('Y');
					}
			?>
				<ul>
					<li class="">
						<label for="f_status">Bulan</label>
						<select name="bulan" onchange="return submit();">
							<option <?if(@$_POST['bulan']==1){echo 'selected';}?> value="1">Januari</option>
							<option <?if(@$_POST['bulan']==2){echo 'selected';}?> value="2">February</option>
							<option <?if(@$_POST['bulan']==3){echo 'selected';}?> value="3">Maret</option>
							<option <?if(@$_POST['bulan']==4){echo 'selected';}?> value="4">April</option>
							<option <?if(@$_POST['bulan']==5){echo 'selected';}?> value="5">Mei</option>
							<option <?if(@$_POST['bulan']==6){echo 'selected';}?> value="6">Juni</option>
							<option <?if(@$_POST['bulan']==7){echo 'selected';}?> value="7">Juli</option>
							<option <?if(@$_POST['bulan']==8){echo 'selected';}?> value="8">Agustus</option>
							<option <?if(@$_POST['bulan']==9){echo 'selected';}?> value="9">September</option>
							<option <?if(@$_POST['bulan']==10){echo 'selected';}?> value="10">Oktober</option>
							<option <?if(@$_POST['bulan']==11){echo 'selected';}?> value="11">November</option>
							<option <?if(@$_POST['bulan']==12){echo 'selected';}?> value="12">Desember</option>
						</select>
					</li>
					<li class="">
						<label for="f_status">Tahun</label>
						<select name="tahun" onchange="return submit();">
							<? for($y=2015;$y<date('Y')+2;$y++){?>
							<option <?if(@$_POST['tahun']==$y){echo 'selected';}?> value="<?=$y?>"><?=$y?></option>
							<? } ?>
						</select>
					</li>
				</ul>
			<?php echo form_close(); ?>
		</fieldset>
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
				<? } ?>
				<div class="buttons" >
					<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
						<span>Simpan</span>
					</button>
					<button class="btn blue" id="btn_print" value="print" name="Print" type="submit">
						<span>Print</span>
					</button>
					<button class="btn blue" id="btn_printck" value="print" name="Print Ceklist" type="submit">
						<span>Print Ceklist</span>
					</button>
				</div><br />	
				<table cellspacing="0">
					<thead>
						<tr>
							<th width="20"><?php //echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
							<th>No</th>
							<th>Alamat</th>
							<th class="collapse">Nama</th>
							<th class="collapse"><?=$bulan?></th>
							<th class="collapse"><?=$bulan_sebelum?></th>
							<th>Pakai</th>
							<th width="180">Bayar</th>
							<th width="20%">Action</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=1;foreach ($pelanggan as $datapelanggan) { 
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
								<td><?php //echo form_checkbox('action_to[]', $datapelanggan['id']) ?></td>
								<td style="color:<?=$color?>;"><?php echo $i++;?></td>
								<td style="color:<?=$color?>;">Gamplong <?php echo $datapelanggan['alamat'];?> (<?php echo $datapelanggan['nomor'];?>)</td>
								<td class="collapse" style="color:<?=$color?>;<? if($baca_meter_current[$datapelanggan['id']]['status']==1){ echo 'background-color:darkseagreen;';}?>"><a href="<?=base_url('admin/pam/printkwitansi/'.$datapelanggan['id'].'/'.$bln.'/'.$thn.'/1')?>" ><? echo $datapelanggan['nama'];?></a></td>
								
								<td class="collapse"><?=@$baca_meter_current[$datapelanggan['id']]['baca_meter']?></td>
								
								<td class="collapse"><?=@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter']?></td>
								
								<td class="collapse"><?=@$baca_meter_current[$datapelanggan['id']]['baca_meter']-@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter']?></td>
								<td class="collapse"><?=bayar(@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter'],@@$baca_meter_current[$datapelanggan['id']]['baca_meter'],$datapelanggan['jenis'])?></td>
								<td class="collapse" id="actionsl"><a href="<?=base_url('admin/pam/printkwitansi/'.$datapelanggan['id'].'/'.$bln.'/'.$thn.'')?>" >Print & Mark</a> | <a href="<?=base_url('admin/pam/unmark/'.$datapelanggan['id'].'/'.$bln.'/'.$thn.'/2')?>" >UnMark</a> | <a href="<?=base_url('admin/pam/printkwitansi/'.$datapelanggan['id'].'/'.$bln.'/'.$thn.'/1')?>" >Print No Mark</a></td>  
							</tr>
						<?php } ?>
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