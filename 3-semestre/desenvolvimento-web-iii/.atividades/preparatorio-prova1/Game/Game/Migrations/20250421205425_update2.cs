using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LojaGames.Migrations
{
    /// <inheritdoc />
    public partial class update2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Games_Consoles_ConsoleId",
                table: "Games");

            migrationBuilder.DropTable(
                name: "Consoles");

            migrationBuilder.RenameColumn(
                name: "ConsoleId",
                table: "Games",
                newName: "GameConsoleId");

            migrationBuilder.RenameIndex(
                name: "IX_Games_ConsoleId",
                table: "Games",
                newName: "IX_Games_GameConsoleId");

            migrationBuilder.CreateTable(
                name: "GameConsoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Descritivo = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GameConsoles", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_Games_GameConsoles_GameConsoleId",
                table: "Games",
                column: "GameConsoleId",
                principalTable: "GameConsoles",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Games_GameConsoles_GameConsoleId",
                table: "Games");

            migrationBuilder.DropTable(
                name: "GameConsoles");

            migrationBuilder.RenameColumn(
                name: "GameConsoleId",
                table: "Games",
                newName: "ConsoleId");

            migrationBuilder.RenameIndex(
                name: "IX_Games_GameConsoleId",
                table: "Games",
                newName: "IX_Games_ConsoleId");

            migrationBuilder.CreateTable(
                name: "Consoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Descritivo = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Consoles", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_Games_Consoles_ConsoleId",
                table: "Games",
                column: "ConsoleId",
                principalTable: "Consoles",
                principalColumn: "Id");
        }
    }
}
