<div class="one_full">
	<section class="title">
		<h4>Tambah Transaksi</h4>
	</section>

	<section class="item">
		<div class="content">
		<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud simpanjaringan" id="simpanjaringan"'); //pr($pelanggan);?>
				<style>
				input[type="text"], input[type="password"], textarea {
					margin: 0;
				}
				</style>

				<div class="buttons" >
					<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
						<span>Simpan</span>
					</button>
				</div><br />	
				<table cellspacing="0">
					<thead>
						<tr><th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
							<th>No</th>
							<th>Tanggal</th>
							<th>Diterima dari</th>
							<th>Nama Rek</th>
							<th>Kolom</th>
							<th>Nominal</th>
							<th>Keterangan</th>
							
						</tr>
					</thead>
					<tbody>
						<?php $i=1;
						
						for ($x=0;$x<5;$x++) { 
						if(isset($_POST['penyetor'][$x])){$penyetor[$x]=$_POST['penyetor'][$x];}else{$penyetor[$x]='';}
						?>
							<tr>
								<td><?php echo form_checkbox('print['.$x.']', 1) ?></td>
								<td><?php echo $i++;?></td>
								<td>
								<?php echo form_input('tanggal['.$x.']', date('Y-m-d'), 'maxlength="10" size="6" class="text width-20 datepicker"') ?>
								</td>
								<td><input type="text" name="penyetor[<?=$x?>]" size="18" value="<?=$penyetor[$x]?>"/></td>
								<td>
									<select name="kode_rek[]">
										<!--<option value="">Pilih Pos Rekening</option>-->
										<? foreach($rekening as $datarek){?>
										<option value="<?=$datarek['id']?>" <? if(@$_POST['kode_rek'][$x]==$datarek['id']){ echo 'selected';}else{}?>><?=$datarek['nama']?></option>
										<? } ?>
									</select>
								</td>
								<td>
									<input type="radio" name="posisi[<?=$x?>]" <? if(@$_POST['posisi'][$x]=='debit'){ echo 'checked';}else{}?> value="debit"/> Debit 
									<input type="radio" name="posisi[<?=$x?>]" <? if(@$_POST['posisi'][$x]=='kredit'){ echo 'checked';}elseif(!isset($_POST['posisi'][$x])){echo 'checked';}?> value="kredit"/> Kredit 
								</td>
								<td>Rp.<input size="10" type="text" name="nominal[<?=$x?>]" value="<?=@$_POST['nominal'][$x]?>"/>,-</td>
								<td style="width:40%;"><textarea cols="10" style="width:95%;" name="keterangan[<?=$x?>]"><?=@$_POST['keterangan'][$x]?></textarea></td>
								
							</tr>
						<?php } ?>
					</tbody>
				</table>

			<div class="buttons" >
				<button class="btn blue" id="btn_edir_member" value="save" name="simpan" type="submit">
					<span>Simpan</span>
				</button>
			</div>	
			<?php echo form_close(); ?>			
		</div>
	</section>
</div>