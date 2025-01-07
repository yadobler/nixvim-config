{
  autoCmd = [
    {
      desc = "return cursor to where it was last time closing the file";
      command = "silent! normal! g`\"zv";
      pattern = ["*"];
      event = ["BufWinEnter"];
    }

    {
      desc = "clear search highlighting when entering insert mode";
      command = "normal! <Cmd>noh<cr>";
      pattern = ["*"];
      event = ["InsertEnter"];
    }
  ];
}
