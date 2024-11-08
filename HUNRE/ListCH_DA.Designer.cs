namespace HUNRE
{
    partial class ListCH_DA
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbNoiDungCH = new System.Windows.Forms.Label();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.lbDapAn = new System.Windows.Forms.Label();
            this.lbCauSo = new System.Windows.Forms.Label();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // lbNoiDungCH
            // 
            this.lbNoiDungCH.AutoEllipsis = true;
            this.lbNoiDungCH.AutoSize = true;
            this.lbNoiDungCH.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lbNoiDungCH.Font = new System.Drawing.Font("Segoe UI Semibold", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbNoiDungCH.Location = new System.Drawing.Point(20, 31);
            this.lbNoiDungCH.Margin = new System.Windows.Forms.Padding(20, 3, 3, 3);
            this.lbNoiDungCH.MaximumSize = new System.Drawing.Size(670, 0);
            this.lbNoiDungCH.MinimumSize = new System.Drawing.Size(670, 0);
            this.lbNoiDungCH.Name = "lbNoiDungCH";
            this.lbNoiDungCH.Size = new System.Drawing.Size(670, 23);
            this.lbNoiDungCH.TabIndex = 10;
            this.lbNoiDungCH.Text = "Nội dung câu hỏi";
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.AutoSize = true;
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.lbDapAn, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.lbNoiDungCH, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lbCauSo, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.Size = new System.Drawing.Size(693, 86);
            this.tableLayoutPanel1.TabIndex = 12;
            // 
            // lbDapAn
            // 
            this.lbDapAn.AutoEllipsis = true;
            this.lbDapAn.AutoSize = true;
            this.lbDapAn.BackColor = System.Drawing.Color.Lime;
            this.lbDapAn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lbDapAn.Font = new System.Drawing.Font("Segoe UI Semibold", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDapAn.Location = new System.Drawing.Point(20, 60);
            this.lbDapAn.Margin = new System.Windows.Forms.Padding(20, 3, 3, 3);
            this.lbDapAn.Name = "lbDapAn";
            this.lbDapAn.Size = new System.Drawing.Size(670, 23);
            this.lbDapAn.TabIndex = 11;
            this.lbDapAn.Text = "Đáp án đúng";
            // 
            // lbCauSo
            // 
            this.lbCauSo.AutoSize = true;
            this.lbCauSo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lbCauSo.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCauSo.ForeColor = System.Drawing.Color.Green;
            this.lbCauSo.Location = new System.Drawing.Point(3, 0);
            this.lbCauSo.Name = "lbCauSo";
            this.lbCauSo.Size = new System.Drawing.Size(687, 28);
            this.lbCauSo.TabIndex = 9;
            this.lbCauSo.Text = "Câu số:";
            // 
            // ListCH_DA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "ListCH_DA";
            this.Size = new System.Drawing.Size(693, 86);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbNoiDungCH;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Label lbCauSo;
        private System.Windows.Forms.Label lbDapAn;
    }
}
