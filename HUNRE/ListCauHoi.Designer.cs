namespace HUNRE
{
    partial class ListCauHoi
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
            this.lbCauSo = new System.Windows.Forms.Label();
            this.lbNoiDungCH = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lbCauSo
            // 
            this.lbCauSo.AutoSize = true;
            this.lbCauSo.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCauSo.ForeColor = System.Drawing.Color.Green;
            this.lbCauSo.Location = new System.Drawing.Point(8, 5);
            this.lbCauSo.Name = "lbCauSo";
            this.lbCauSo.Size = new System.Drawing.Size(78, 28);
            this.lbCauSo.TabIndex = 7;
            this.lbCauSo.Text = "Câu số:";
            // 
            // lbNoiDungCH
            // 
            this.lbNoiDungCH.AutoEllipsis = true;
            this.lbNoiDungCH.AutoSize = true;
            this.lbNoiDungCH.Font = new System.Drawing.Font("Segoe UI Semibold", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbNoiDungCH.Location = new System.Drawing.Point(29, 30);
            this.lbNoiDungCH.MaximumSize = new System.Drawing.Size(950, 0);
            this.lbNoiDungCH.MinimumSize = new System.Drawing.Size(950, 0);
            this.lbNoiDungCH.Name = "lbNoiDungCH";
            this.lbNoiDungCH.Size = new System.Drawing.Size(950, 23);
            this.lbNoiDungCH.TabIndex = 8;
            this.lbNoiDungCH.Text = "Nội dung câu hỏi";
            // 
            // ListCauHoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.Controls.Add(this.lbNoiDungCH);
            this.Controls.Add(this.lbCauSo);
            this.Name = "ListCauHoi";
            this.Size = new System.Drawing.Size(982, 53);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbCauSo;
        private System.Windows.Forms.Label lbNoiDungCH;
    }
}
