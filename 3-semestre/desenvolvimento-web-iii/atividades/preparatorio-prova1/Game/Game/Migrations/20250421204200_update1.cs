using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LojaGames.Migrations
{
    /// <inheritdoc />
    public partial class update1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "GameId",
                table: "Games_Lojas",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "LojaId",
                table: "Games_Lojas",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Nome",
                table: "Games",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddColumn<Guid>(
                name: "ConsoleId",
                table: "Games",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Games_Lojas_GameId",
                table: "Games_Lojas",
                column: "GameId");

            migrationBuilder.CreateIndex(
                name: "IX_Games_Lojas_LojaId",
                table: "Games_Lojas",
                column: "LojaId");

            migrationBuilder.CreateIndex(
                name: "IX_Games_ConsoleId",
                table: "Games",
                column: "ConsoleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Games_Consoles_ConsoleId",
                table: "Games",
                column: "ConsoleId",
                principalTable: "Consoles",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Games_Lojas_Games_GameId",
                table: "Games_Lojas",
                column: "GameId",
                principalTable: "Games",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Games_Lojas_Lojas_LojaId",
                table: "Games_Lojas",
                column: "LojaId",
                principalTable: "Lojas",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Games_Consoles_ConsoleId",
                table: "Games");

            migrationBuilder.DropForeignKey(
                name: "FK_Games_Lojas_Games_GameId",
                table: "Games_Lojas");

            migrationBuilder.DropForeignKey(
                name: "FK_Games_Lojas_Lojas_LojaId",
                table: "Games_Lojas");

            migrationBuilder.DropIndex(
                name: "IX_Games_Lojas_GameId",
                table: "Games_Lojas");

            migrationBuilder.DropIndex(
                name: "IX_Games_Lojas_LojaId",
                table: "Games_Lojas");

            migrationBuilder.DropIndex(
                name: "IX_Games_ConsoleId",
                table: "Games");

            migrationBuilder.DropColumn(
                name: "GameId",
                table: "Games_Lojas");

            migrationBuilder.DropColumn(
                name: "LojaId",
                table: "Games_Lojas");

            migrationBuilder.DropColumn(
                name: "ConsoleId",
                table: "Games");

            migrationBuilder.AlterColumn<string>(
                name: "Nome",
                table: "Games",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);
        }
    }
}
