using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Models;

public partial class QuanLyBenhCaContext : DbContext
{
    public QuanLyBenhCaContext(DbContextOptions<QuanLyBenhCaContext> options)
        : base(options) { }

    public virtual DbSet<BaiDang>? BaiDang { get; set; }

    public virtual DbSet<BenhCa>? BenhCa { get; set; }

    public virtual DbSet<BienPhapPhongNgua>? BienPhapPhongNgua { get; set; }

    public virtual DbSet<DanCa>? DanCa { get; set; }

    public virtual DbSet<LichSuBenh>? LichSuBenh { get; set; }

    public virtual DbSet<NguoiDung>? NguoiDung { get; set; }

    public virtual DbSet<NguoiNuoiCa>? NguoiNuoiCa { get; set; }

    public virtual DbSet<PhuongPhapDieuTri>? PhuongPhapDieuTri { get; set; }

    public virtual DbSet<TinTucDichBenh>? TinTucDichBenh { get; set; }

    public virtual DbSet<TrieuChungBenhCa>? TrieuChungBenhCa { get; set; }

    public virtual DbSet<KetQuaChuanDoan>? KetQuaChuanDoan { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BaiDang>(entity =>
        {
            entity.HasKey(e => e.MaBd).HasName("PK__BaiDang__272475A7D6B75EF2");

            entity.ToTable("BaiDang");

            entity.Property(e => e.MaBd)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.MaNnc).HasColumnName("MaNNC");
            entity.Property(e => e.MoTa).HasMaxLength(500);

            entity.HasOne(d => d.MaNncNavigation).WithMany(p => p.BaiDangs)
                .HasForeignKey(d => d.MaNnc)
                .HasConstraintName("FK__BaiDang__MaNNC__267ABA7A");
        });

        modelBuilder.Entity<BenhCa>(entity =>
        {
            entity.HasKey(e => e.MaBc).HasName("PK__BenhCa__272475A65E6D7CFB");

            entity.ToTable("BenhCa");

            entity.Property(e => e.MaBc)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.MoTaChiTietBenhCa).HasMaxLength(500);
            entity.Property(e => e.TenBc)
                .HasMaxLength(100)
                .HasColumnName("TenBC");

            //entity.HasMany(d => d.MaTcbcs).WithMany(p => p.MaBcs)
            //    .UsingEntity<Dictionary<string, object>>(
            //        "KetQuaChuanDoan",
            //        r => r.HasOne<TrieuChungBenhCa>().WithMany()
            //            .HasForeignKey("MaTcbc")
            //            .OnDelete(DeleteBehavior.ClientSetNull)
            //            .HasConstraintName("FK__KetQuaChu__MaTCB__38996AB5"),
            //        l => l.HasOne<BenhCa>().WithMany()
            //            .HasForeignKey("MaBc")
            //            .OnDelete(DeleteBehavior.ClientSetNull)
            //            .HasConstraintName("FK__KetQuaChua__MaBC__37A5467C"),
            //        j =>
            //        {
            //            j.HasKey("MaBc", "MaTcbc").HasName("PK__KetQuaCh__FC1237F565273461");
            //            j.ToTable("KetQuaChuanDoan");
            //            j.IndexerProperty<int>("MaBc").HasColumnName("MaBC");
            //            j.IndexerProperty<int>("MaTcbc").HasColumnName("MaTCBC");
            //        });
        });

        modelBuilder.Entity<BienPhapPhongNgua>(entity =>
        {
            entity.HasKey(e => e.MaBppn).HasName("PK__BienPhap__890C97739EC7D2DD");

            entity.ToTable("BienPhapPhongNgua");

            entity.HasIndex(e => e.MaBenhCa, "UQ_BienPhapPhongNgua_MaBenhCa").IsUnique();

            entity.Property(e => e.MaBppn)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.TenBppn)
                .HasMaxLength(100)
                .HasColumnName("TenBPPN");

            entity.HasOne(d => d.MaBenhCaNavigation).WithOne(p => p.BienPhapPhongNgua)
                .HasForeignKey<BienPhapPhongNgua>(d => d.MaBenhCa)
                .HasConstraintName("FK__BienPhapP__MaBen__59FA5E80");
        });

        modelBuilder.Entity<DanCa>(entity =>
        {
            entity.HasKey(e => e.MaDc).HasName("PK__DanCa__27258664DB51D255");

            entity.ToTable("DanCa");

            entity.Property(e => e.MaDc)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.MaNnc).HasColumnName("MaNNC");
            entity.Property(e => e.TenDanCa).HasMaxLength(100);
            entity.Property(e => e.TrangThai).HasMaxLength(50);

            entity.HasOne(d => d.MaNncNavigation).WithMany(p => p.DanCas)
                .HasForeignKey(d => d.MaNnc)
                .HasConstraintName("FK__DanCa__MaNNC__29572725");
        });

        modelBuilder.Entity<LichSuBenh>(entity =>
        {
            entity.HasKey(e => new { e.NgayPhatHien, e.MaDc, e.MaBc }).HasName("PK__LichSuBe__390081EC38B511E6");

            entity.ToTable("LichSuBenh");

            entity.Property(e => e.MaDc).HasColumnName("MaDC");
            entity.Property(e => e.MaBc).HasColumnName("MaBC");
            entity.Property(e => e.KetQuaDieuTri).HasMaxLength(100);

            entity.HasOne(d => d.MaBcNavigation).WithMany(p => p.LichSuBenhs)
                .HasForeignKey(d => d.MaBc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__LichSuBenh__MaBC__34C8D9D1");

            entity.HasOne(d => d.MaDcNavigation).WithMany(p => p.LichSuBenhs)
                .HasForeignKey(d => d.MaDc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__LichSuBenh__MaDC__33D4B598");
        });

        modelBuilder.Entity<NguoiDung>(entity =>
        {
            entity.HasKey(e => e.MaNd).HasName("PK__NguoiDun__2725D724D4B5EF86");

            entity.ToTable("NguoiDung");

            entity.Property(e => e.MaNd)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.MatKhau).HasMaxLength(100);
            entity.Property(e => e.QuyenNguoiDung).HasMaxLength(50);
            entity.Property(e => e.TenNd)
                .HasMaxLength(100)
                .HasColumnName("TenND");
        });

        modelBuilder.Entity<NguoiNuoiCa>(entity =>
        {
            entity.HasKey(e => e.MaNnc).HasName("PK__NguoiNuo__3A18235D87170C9A");

            entity.ToTable("NguoiNuoiCa");

            entity.Property(e => e.MaNnc)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.DiaChi).HasMaxLength(200);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.HoTenNnc)
                .HasMaxLength(100)
                .HasColumnName("HoTenNNC");
            entity.Property(e => e.MaNd).HasColumnName("MaND");
            entity.Property(e => e.Sdt)
                .HasMaxLength(15)
                .HasColumnName("SDT");

            entity.HasOne(d => d.MaNdNavigation).WithMany(p => p.NguoiNuoiCas)
                .HasForeignKey(d => d.MaNd)
                .HasConstraintName("FK__NguoiNuoiC__MaND__59063A47");
        });

        modelBuilder.Entity<PhuongPhapDieuTri>(entity =>
        {
            entity.HasKey(e => e.MaPpdt).HasName("PK__PhuongPh__B01177DA16E336C9");

            entity.ToTable("PhuongPhapDieuTri");

            entity.HasIndex(e => e.MaBenhCa, "UQ_PhuongPhapDieuTri_MaBenhCa").IsUnique();

            entity.Property(e => e.MaPpdt)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.TenPpdt)
                .HasMaxLength(100)
                .HasColumnName("TenPPDT");

            entity.HasOne(d => d.MaBenhCaNavigation).WithOne(p => p.PhuongPhapDieuTri)
                .HasForeignKey<PhuongPhapDieuTri>(d => d.MaBenhCa)
                .HasConstraintName("FK__PhuongPha__MaBen__5AEE82B9");
        });

        modelBuilder.Entity<TinTucDichBenh>(entity =>
        {
            entity.HasKey(e => e.MaTtdb).HasName("PK__TinTucDi__4484B8536FBEAE3F");

            entity.ToTable("TinTucDichBenh");

            entity.Property(e => e.MaTtdb)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.MaBc).HasColumnName("MaBC");
            entity.Property(e => e.MoTa).HasMaxLength(500);
            entity.Property(e => e.TenTtdb)
                .HasMaxLength(100)
                .HasColumnName("TenTTDB");

            entity.HasOne(d => d.MaBcNavigation).WithMany(p => p.TinTucDichBenhs)
                .HasForeignKey(d => d.MaBc)
                .HasConstraintName("FK__TinTucDich__MaBC__571DF1D5");
        });

        modelBuilder.Entity<TrieuChungBenhCa>(entity =>
        {
            entity.HasKey(e => e.MaTcbc).HasName("PK__TrieuChu__B364253CC139E2E9");

            entity.ToTable("TrieuChungBenhCa");

            entity.Property(e => e.MaTcbc)
                .ValueGeneratedOnAdd();
            entity.Property(e => e.TenTrieuChung).HasMaxLength(100);
        });

        modelBuilder.Entity<KetQuaChuanDoan>()
            .HasKey(cd => new { cd.MaBc, cd.MaTcbc });

        modelBuilder.Entity<KetQuaChuanDoan>()
        .HasOne(cd => cd.BenhCa)
        .WithMany(b => b.KetQuaChuanDoan)  // Sửa lại thành .ChanDoans
        .HasForeignKey(cd => cd.MaBc);

        modelBuilder.Entity<KetQuaChuanDoan>()
            .HasOne(cd => cd.TrieuChungBenhCa)
            .WithMany(tc => tc.KetQuaChuanDoan)  // Sửa lại thành .ChanDoans
            .HasForeignKey(cd => cd.MaTcbc);

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
