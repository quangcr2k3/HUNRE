namespace HUNRE
{
    partial class ListTraLoi
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
            this.rd_D = new System.Windows.Forms.RadioButton();
            this.rd_C = new System.Windows.Forms.RadioButton();
            this.rd_B = new System.Windows.Forms.RadioButton();
            this.rd_A = new System.Windows.Forms.RadioButton();
            this.lbCauSo = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // rd_D
            // 
            this.rd_D.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.rd_D.AutoSize = true;
            this.rd_D.Enabled = false;
            this.rd_D.Location = new System.Drawing.Point(184, 6);
            this.rd_D.Name = "rd_D";
            this.rd_D.Size = new System.Drawing.Size(17, 16);
            this.rd_D.TabIndex = 15;
            this.rd_D.UseVisualStyleBackColor = true;
            // 
            // rd_C
            // 
            this.rd_C.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.rd_C.AutoSize = true;
            this.rd_C.Enabled = false;
            this.rd_C.Location = new System.Drawing.Point(147, 6);
            this.rd_C.Name = "rd_C";
            this.rd_C.Size = new System.Drawing.Size(17, 16);
            this.rd_C.TabIndex = 14;
            this.rd_C.UseVisualStyleBackColor = true;
            // 
            // rd_B
            // 
            this.rd_B.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.rd_B.AutoSize = true;
            this.rd_B.Enabled = false;
            this.rd_B.Location = new System.Drawing.Point(110, 6);
            this.rd_B.Name = "rd_B";
            this.rd_B.Size = new System.Drawing.Size(17, 16);
            this.rd_B.TabIndex = 13;
            this.rd_B.UseVisualStyleBackColor = true;
            // 
            // rd_A
            // 
            this.rd_A.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.rd_A.AutoSize = true;
            this.rd_A.Enabled = false;
            this.rd_A.Location = new System.Drawing.Point(73, 6);
            this.rd_A.Name = "rd_A";
            this.rd_A.Size = new System.Drawing.Size(17, 16);
            this.rd_A.TabIndex = 12;
            this.rd_A.UseVisualStyleBackColor = true;
            // 
            // lbCauSo
            // 
            this.lbCauSo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbCauSo.AutoSize = true;
            this.lbCauSo.Font = new System.Drawing.Font("Segoe UI Semibold", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCauSo.Location = new System.Drawing.Point(3, 3);
            this.lbCauSo.Margin = new System.Windows.Forms.Padding(3, 0, 0, 0);
            this.lbCauSo.Name = "lbCauSo";
            this.lbCauSo.Size = new System.Drawing.Size(66, 23);
            this.lbCauSo.TabIndex = 11;
            this.lbCauSo.Text = "Câu số:";
            // 
            // ListTraLoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Controls.Add(this.rd_D);
            this.Controls.Add(this.rd_C);
            this.Controls.Add(this.rd_B);
            this.Controls.Add(this.rd_A);
            this.Controls.Add(this.lbCauSo);
            this.Name = "ListTraLoi";
            this.Size = new System.Drawing.Size(210, 28);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton rd_D;
        private System.Windows.Forms.RadioButton rd_C;
        private System.Windows.Forms.RadioButton rd_B;
        private System.Windows.Forms.RadioButton rd_A;
        private System.Windows.Forms.Label lbCauSo;
    }
}
