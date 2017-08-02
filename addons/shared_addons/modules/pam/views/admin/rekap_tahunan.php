<div class="one_full">
	<section class="title">
		<h4>Pembukuan Keuangan</h4>
	</section>

	<section class="item">
		<div class="content">
		<fieldset id="filters">
			<legend>Filters & Search</legend>
			<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpanjaringan"'); 
			if(!isset($_POST['tahun'])){@$_POST['tahun']=date('Y');}
			?>
				<ul>
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

				<div class="buttons" >
					<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
						<span>Simpan</span>
					</button>
					<button class="btn blue" onclick="javascript:location='<?=base_url('admin/pam/tambah_transaksi');?>'" id="btn_edir_member" value="save" name="simpan" type="button">
						<span>Tambah Transaksi</span>
					</button>
				</div><br />

				<table cellspacing="0">
					<thead>
						<tr>
							<th>No</th>
							<th>Bulan</th>
							<th>Debit</th>
							<th>Kredit</th>
							<th>Saldo</th>
						</tr>
					</thead>
					<tbody>
						<?$no=1; foreach($neraca as $dtn){?>
						<tr>
							<td ><?=$no++?></td>
							<td ><?=date("F Y", mktime(0, 0, 0, $dtn['bulan'],1 , $tahun))?></td>
							<td ><?=$dtn['debit']?></td>
							<td ><?=$dtn['kredit']?></td>
							<td ><?=$dtn['saldo']?></td>
						</tr>
						<? 
							$totthnd=$totthnd+$dtn['debit'];
							$totthnk=$totthnk+$dtn['kredit'];
						} ?>
						<tr>
							<td colspan="4">Saldo</td>
							<td ><b><?=$totthnd-$totthnk?></b></td>
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