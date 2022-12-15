const TokenService = require('../helpers/token');
const ApiError = require('../errors/apiError');

const authorization = (req, res, next) => {

  const tokenService = new TokenService();

  // extract Token from Request
  const token = tokenService.extract(req);

  if (!token) return next(new ApiError(401, 'Vous devez vous logguer pour accéder à cette fonctionnalité.'));

  const role = tokenService.decode(token).role;

  if (role === 'admin') {
    return next();
  } else {
    return next(new ApiError(401, `Vous n'avez pas les droits pour effectuer cette action.`));
  }

  res.json(role);

}

module.exports = authorization;