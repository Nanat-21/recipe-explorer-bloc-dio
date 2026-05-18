class DeleteMeal {
  List cache;

  DeleteMeal(this.cache);

  List call(String id) {
    cache.removeWhere((m) => m["idMeal"] == id);
    return cache;
  }
}