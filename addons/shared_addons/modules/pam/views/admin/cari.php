<div class="one_full">
	<section class="title">
		<h4>Input Data Baca Meter</h4>
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
						<label for="f_status">Tahun</label>
						<select name="tahun" >
							<? for($y=2015;$y<date('Y')+2;$y++){?>
							<option <?if(@$_POST['tahun']==$y){echo 'selected';}elseif(date('Y')==$y){echo 'selected';}?> value="<?=$y?>"><?=$y?></option>
							<? } ?>
						</select>
					</li>
					<li class="">
						<label for="f_status">Gamplong</label>
						<select name="alamat">
							<option <?if(@$_POST['alamat']=='semua'){echo 'selected';}?> value="semua">Semua</option>
							<option <?if(@$_POST['alamat']==1){echo 'selected';}?> value="1">1</option>
							<option <?if(@$_POST['alamat']==2){echo 'selected';}?> value="2">2</option>
							<option <?if(@$_POST['alamat']==3){echo 'selected';}?> value="3">3</option>
							<option <?if(@$_POST['alamat']==4){echo 'selected';}?> value="4">4</option>
							<option <?if(@$_POST['alamat']==5){echo 'selected';}?> value="5">5</option>
						</select>
					</li>
					<li class="" style="position: relative; bottom: 10px;">
						<label for="f_status">Nama</label>
						<input type="text" name="nama" value="<?=@$_POST['nama']?>" style="height: 47px;width:300px;font-size:21px;"/>
					</li>
					<li class="" style="position: relative; bottom: 10px;">
						<input type="submit" name="cari" value="CARI"  style="height: 47px;width:75px;font-size:21px;"/>
					</li>
				</ul>
			<?php echo form_close(); ?>
		</fieldset>
		<?php echo form_open_multipart('admin/pam/inputdata', 'class="crud simpanjaringan" id="simpanjaringan"'); //pr($pelanggan);?>
				<style>
				input[type="text"], input[type="password"], textarea {
					margin: 0;
				}
				</style>
				<? //pr($pelanggan);?>
				<table cellspacing="0">
					<thead>
						<tr>
							<th>No</th>
							<th>GP</th>
							<th class="collapse">Nama</th>
							<th>Bulan</th>
							<th>Pakai</th>
							<th width="180">Bayar</th>
							<th width="180">Action</th>
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
							$bulan_currents=explode('-',$datapelanggan['bulan']);
							$veryf=strtoupper(date("m", mktime(0, 0, 0, date('m')-1  ,1 , date('Y'))));
							if($veryf==$bulan_currents[1]){
							$bg='style="background:lightgreen repeat-x scroll 0 0;"';
							$bg='';
							$bgx='background:lightgreen repeat-x scroll 0 0;';
							}else{
							$bg='';
							$bgx='';
							}
							$bayar=bayar($datapelanggan['baca_s'],$datapelanggan['baca_meter'],$datapelanggan['jenis'],$datapelanggan['id_pemb'],$datapelanggan['harus_bayar']);
							?>
						
							<tr >
								<td <?=@$bg?> style="color:<?=$color?>;"><?php echo $i++;?></td>
								<td <?=@$bg?> style="color:<?=$color?>;">GP <?php echo $datapelanggan['alamat'];?> (<?php echo $datapelanggan['nomor'];?>)</td>
								<td class="collapse" style="color:<?=$color?>;<? if($datapelanggan['status']==1){ echo 'background-color:darkseagreen;';}else{}?>"><? echo $datapelanggan['nama'];?></td>
								<td <?=@$bg?> class="collapse"><?=strtoupper(date("F", mktime(0, 0, 0, $bulan_currents[1]  ,$bulan_currents[2] , $bulan_currents[0])))?></td>
								<td <?=@$bg?> class="collapse"><?=$datapelanggan['baca_meter']-$datapelanggan['baca_s']?></td>
								<td <?=@$bg?> class="collapse"><?=$bayar?></td>
								<td <?=@$bg?> class="collapse"><a href="<?=base_url('admin/pam/printkwitansi/'.$datapelanggan['id'].'/'.$bulan_currents[1].'/'.$bulan_currents[0].'')?>" >Print</a> --|-- <a href="<?=base_url('admin/pam/printkwitansi/'.$datapelanggan['id'].'/'.$bulan_currents[1].'/'.$bulan_currents[0].'/1')?>" >No Mark</a></td>  
							</tr>
						<?php } ?>
					</tbody>
				</table>

			<?php echo form_close(); ?>			
		</div>
	</section>
</div>