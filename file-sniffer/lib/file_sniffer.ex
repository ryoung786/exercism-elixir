defmodule FileSniffer do
  @media_types %{
    elf: "application/octet-stream",
    bmp: "image/bmp",
    jpg: "image/jpg",
    gif: "image/gif",
    png: "image/png"
  }

  def type_from_extension("exe"), do: @media_types.elf
  def type_from_extension("bmp"), do: @media_types.bmp
  def type_from_extension("jpg"), do: @media_types.jpg
  def type_from_extension("gif"), do: @media_types.gif
  def type_from_extension("png"), do: @media_types.png

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46>> <> _), do: @media_types.elf
  def type_from_binary(<<0x42, 0x4D>> <> _), do: @media_types.bmp
  def type_from_binary(<<0xFF, 0xD8, 0xFF>> <> _), do: @media_types.jpg
  def type_from_binary(<<0x47, 0x49, 0x46>> <> _), do: @media_types.gif

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>> <> _),
    do: @media_types.png

  def verify(file_binary, extension) do
    case {type_from_binary(file_binary), type_from_extension(extension)} do
      {media_type, media_type} -> {:ok, media_type}
      _ -> {:error, "Warning, file format and file extension do not match."}
    end
  end
end
