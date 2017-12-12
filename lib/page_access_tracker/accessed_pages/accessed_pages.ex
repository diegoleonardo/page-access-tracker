defmodule PageAccessTracker.AccessedPages do
  @moduledoc """
  The AccessedPages context.
  """

  import Ecto.Query, warn: false
  alias PageAccessTracker.Repo

  alias PageAccessTracker.AccessedPages.AccessedPage

  @doc """
  Returns the list of accessed_pages.

  ## Examples

      iex> list_accessed_pages()
      [%AccessedPage{}, ...]

  """
  def list_accessed_pages do
    Repo.all(AccessedPage)
  end

  @doc """
  Gets a single accessed_page.

  Raises `Ecto.NoResultsError` if the Accessed page does not exist.

  ## Examples

      iex> get_accessed_page!(123)
      %AccessedPage{}

      iex> get_accessed_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_accessed_page!(id), do: Repo.get!(AccessedPage, id)

  @doc """
  Creates a accessed_page.

  ## Examples

      iex> create_accessed_page(%{field: value})
      {:ok, %AccessedPage{}}

      iex> create_accessed_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_accessed_page(attrs \\ %{}) do
    %AccessedPage{}
    |> AccessedPage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a accessed_page.

  ## Examples

      iex> update_accessed_page(accessed_page, %{field: new_value})
      {:ok, %AccessedPage{}}

      iex> update_accessed_page(accessed_page, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_accessed_page(%AccessedPage{} = accessed_page, attrs) do
    accessed_page
    |> AccessedPage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AccessedPage.

  ## Examples

      iex> delete_accessed_page(accessed_page)
      {:ok, %AccessedPage{}}

      iex> delete_accessed_page(accessed_page)
      {:error, %Ecto.Changeset{}}

  """
  def delete_accessed_page(%AccessedPage{} = accessed_page) do
    Repo.delete(accessed_page)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking accessed_page changes.

  ## Examples

      iex> change_accessed_page(accessed_page)
      %Ecto.Changeset{source: %AccessedPage{}}

  """
  def change_accessed_page(%AccessedPage{} = accessed_page) do
    AccessedPage.changeset(accessed_page, %{})
  end

  def list_pages_accesseds(id) do
    Repo.all(from p in AccessedPage,
              join: v in assoc(p, :visitor),
              join: c in assoc(v, :contacts),
              where: c.id == ^id,
             select: p)
  end
end
